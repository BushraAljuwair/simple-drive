module Infrastructure
  module Storages
    class S3Storage
      def save(blob)
        File.write(
          Rails.root.join("storage", "s3_#{blob.id}"),
          blob.data
        )
      end


      def find(id)
        File.read(
          Rails.root.join("storage", "s3_#{id}")
        )
      end
    end
  end
end
