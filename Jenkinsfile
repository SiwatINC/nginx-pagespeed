node {
  git branch: 'master', url: 'https://github.com/SiwatINC/nginx-pagespeed'
  docker.withRegistry("https://ghcr.io/v2") {
      docker.build("siwatinc/nginx-pagespeed:latest",'./ --no-cache').push()
  }
}
