node {
  git 'https://github.com/SiwatINC/nginx-pagespeed' // checks out Dockerfile and some project sources
  def image = docker.build "siwatinc/nginx-pagespeed:latest"
  image.push()
  docker.withRegistry("https://ghcr.io/v2") {
      image.push()
  }
  
}
