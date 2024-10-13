local deploy = import '../../../lib/deploy.libsonnet';
local currentTag = importstr './currentTag.txt';
[
  deploy.app(
    name = 'testapp',
    image = 'ghcr.io/eliihen/remix-test',
    tag = currentTag,
  )
]
