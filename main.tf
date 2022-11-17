
resource "aws_vpc" "test" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.0.0/17"
  depends_on = [
      aws_vpc.test
    ]

  tags = {
    Name = "private"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.test.id
  cidr_block = "10.0.128.0/17"
  depends_on = [
      aws_vpc.test
    ]

  tags = {
    Name = "public"
  }
}

resource "aws_instance" "launch" {
    ami = "ami-0e6329e222e662a52"
    subnet_id = aws_subnet.public-subnet.id
    instance_type = "t2.micro"
    depends_on = [
      aws_vpc.test
    ]
  
}


resource "aws_s3_bucket" "bucket-store-state-files-date" {
  bucket = "test-bucket-state-files-flies"
}



