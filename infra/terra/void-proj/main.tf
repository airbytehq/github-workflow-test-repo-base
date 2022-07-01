resource "random_id" "this" {
  byte_length = 2
}

output "random_hex" {
  value = random_id.this.hex
}
