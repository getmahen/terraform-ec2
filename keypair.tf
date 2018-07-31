resource "aws_key_pair" "mypersonal_keypair" {
  key_name   = "mypersonal_keypair_1"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}