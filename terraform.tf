terraform {
        backend "s3" {
                bucket = "test-bucket-state-files-flies"
                key = "../.tfstate"
                region = "ap-south-1"

}

}
