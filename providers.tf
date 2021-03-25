provider google {
  version = "= 3.3.0"
    #credentials = file("C:\\Users\\jinyj\\OneDrive\\Desktop\\dataflowclassicmodule\\creds.json")
}


terraform {
  backend "gcs" {
    bucket = "terrabucket91"
    prefix = "terraform/modulestate"
  }
}