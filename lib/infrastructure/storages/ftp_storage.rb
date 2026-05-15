require "net/ftp"

module Infrastructure
  module Storages
    class FtpStorage
      def save(blob)
  puts "1- connecting..."

  ftp = Net::FTP.new
  ftp.connect("192.168.8.165", 21)

  puts "2- connected"

  ftp.passive = true

  puts "3- login..."

  ftp.login("me", "1234")

  puts "4- logged in"

  local_path = Rails.root.join(
    "storage",
    "ftp_#{blob.id}"
  )

  File.write(
    local_path,
    blob.data
  )

  puts "5- uploading..."

  ftp.putbinaryfile(
    local_path,
    blob.id
  )

  puts "6- uploaded"

  ftp.close
end


      def find(id)
        ftp = Net::FTP.new

        ftp.connect("192.168.8.165", 21)
        ftp.login("me", "1234")

        local_path = Rails.root.join(
          "storage",
          "ftp_#{id}"
        )

        ftp.getbinaryfile(
          id,
          local_path
        )

        ftp.close

        File.read(local_path)
      end
    end
  end
end
