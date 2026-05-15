module Infrastructure
  module Storages
    class LocalStorage
      STORAGE_PATH = "storage/blobs"

      def initialize
        Dir.mkdir("storage") unless Dir.exist?("storage")
        Dir.mkdir(STORAGE_PATH) unless Dir.exist?(STORAGE_PATH)
      end

      def save(blob)
        File.binwrite(
          "#{STORAGE_PATH}/#{blob.id}",
          blob.data
        )
      end

      def find(id)
        path = "#{STORAGE_PATH}/#{id}"

        return nil unless File.exist?(path)

        File.binread(path)
      end
    end
  end
end
