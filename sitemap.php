<?php
// Simple sitemap generator for this project.
// Set environment variable BASE_URL (e.g. https://example.com) or edit $base below.
$base = getenv('BASE_URL') ?: 'https://example.com';

$excludeDirs = [
    'backend', 'vendor', 'master', 'node_modules', '.git', 'assets', 'include'
];

$basePath = realpath(__DIR__);
$scanDirs = [$basePath, $basePath . DIRECTORY_SEPARATOR . 'frontend'];

$urls = [];

function is_excluded($path, $excludeDirs) {
    foreach ($excludeDirs as $ex) {
        if (stripos($path, DIRECTORY_SEPARATOR . $ex) !== false) return true;
    }
    return false;
}

function scan_dir($dir, $basePath, &$urls, $excludeDirs) {
    $items = @scandir($dir);
    if (!$items) return;
    foreach ($items as $item) {
        if ($item === '.' || $item === '..') continue;
        $path = $dir . DIRECTORY_SEPARATOR . $item;
        if (is_excluded($path, $excludeDirs)) continue;
        if (is_dir($path)) {
            scan_dir($path, $basePath, $urls, $excludeDirs);
            continue;
        }
        if (!preg_match('/\.php$/i', $item)) continue;
        $skipFiles = ['config.php', 'checklogin.php', 'header.php', 'footer.php'];
        if (in_array($item, $skipFiles)) continue;
        $rel = str_replace($basePath, '', $path);
        $rel = str_replace('\\', '/', $rel);
        $rel = '/' . ltrim($rel, '/');
        // Normalize index.php -> directory path
        if (basename($rel) === 'index.php') {
            $dirpath = rtrim(dirname($rel), '/\\');
            $rel = $dirpath === '' ? '/' : $dirpath . '/';
        }
        $urls[$rel] = filemtime($path);
    }
}

foreach ($scanDirs as $d) {
    if ($d && is_dir($d)) scan_dir($d, $basePath, $urls, $excludeDirs);
}

// Build XML
$ns = 'http://www.sitemaps.org/schemas/sitemap/0.9';
$xml = new SimpleXMLElement('<?xml version="1.0" encoding="UTF-8"?><urlset/>');
$xml->addAttribute('xmlns', $ns);

foreach ($urls as $path => $mtime) {
    $url = $xml->addChild('url');
    $loc = rtrim($base, '/') . ($path === '/' ? '/' : $path);
    $url->addChild('loc', htmlspecialchars($loc, ENT_XML1 | ENT_COMPAT, 'UTF-8'));
    $url->addChild('lastmod', date('c', $mtime));
    $url->addChild('changefreq', 'weekly');
    $url->addChild('priority', '0.5');
}

$xmlString = $xml->asXML();
file_put_contents(__DIR__ . DIRECTORY_SEPARATOR . 'sitemap.xml', $xmlString);
header('Content-Type: application/xml; charset=utf-8');
echo $xmlString;
