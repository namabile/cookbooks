default["tachyon"]["version"] = "0.7.1"
default["tachyon"]["distribution"] = "tachyon-0.7.1-bin"
default["tachyon"]["file"] = "#{node["tachyon"]["distribution"]}.tar.gz"
default["tachyon"]["download_url"] = "https://github.com/amplab/tachyon/releases/download/v#{node["tachyon"]["version"]}/#{node["tachyon"]["file"]}"
default["tachyon"]["checksum"] = "44cee5d5fc1e845765cd12733cb785c3b404293bbce277206e569184da3f7b08"
default["tachyon"]["install_dir"] = "/opt/tachyon"
default["tachyon"]["web_ui_port"] = "19999"
default["tachyon"]["master_host"] = "localhost"
default["tachyon"]["underfs_address"] = "localhost"
default["tachyon"]["worker_ips"] = ["localhost"]
