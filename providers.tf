provider google {
  version = "= 3.3.0"
    credentials = file("test/fixtures/default/")
}


terraform {
  backend "gcs" {
    bucket = "terrabucket91"
    prefix = "terraform/modulestate"
  }
}