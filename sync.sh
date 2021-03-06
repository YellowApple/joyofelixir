#!/bin/bash
bundle exec jekyll build
aws s3 sync _site s3://joyofelixir.com --acl public-read --delete --exclude _site/book.pdf --exclude _site/images/*.pxm

# Invalid CloudFront caches, otherwise new content will not display.

aws cloudfront create-invalidation --distribution-id E2VMVK9PHS2KRO --paths '/*'
