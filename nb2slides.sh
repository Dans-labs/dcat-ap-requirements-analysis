#!/bin/sh
jupyter nbconvert $1 --to slides --SlidesExporter.reveal_scroll=True
jupyter nbconvert $1 --to webpdf --allow-chromium-download