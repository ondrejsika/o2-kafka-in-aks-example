resource "cloudflare_record" "aks" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019" // sikademo.com
  name    = "o2"
  content = "74.178.105.111"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "aks_wildcard" {
  zone_id = "f2c00168a7ecd694bb1ba017b332c019" // sikademo.com
  name    = "*.o2"
  content = "o2.sikademo.com"
  type    = "CNAME"
  proxied = false
}
