require "net/ftp"

module Infrastructure
  module Storages
    class FtpStorage
      def save(blob)
        ftp = Net::FTP.new

        ftp.connect(
          "localhost",
          21
        )

        ftp.login(
          "anonymous",
          ""
        )


        local_path = Rails.root.join(
          "storage",
          "ftp_#{blob.id}"
        )

        File.write(
          local_path,
          blob.data
        )


        ftp.putbinaryfile(
          local_path,
          blob.id
        )

        ftp.close
      end



      def find(id)
        ftp = Net::FTP.new

        ftp.connect(
          "localhost",
          21
        )

        ftp.login(
          "anonymous",
          ""
        )


        local_path = Rails.root.join(
          "storage",
          "ftp_#{id}"
        )


        ftp.getbinaryfile(
          id,
          local_path
        )

        ftp.close


        File.read(
          local_path
        )
      end
    end
  end
end
