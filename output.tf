output "vpcid" {
    value = aws_vpc.test.id
}

output "subnet" {
    value = aws_subnet.public-subnet.id
  
}