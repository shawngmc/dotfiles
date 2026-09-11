# Unlock Bitwarden CLI and export BW_SESSION for this shell session
bw_unlock() {
  export BW_SESSION=$(bw unlock --raw)
}       
