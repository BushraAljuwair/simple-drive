module Infrastructure
  module Repositories
    class BlobRepositoryImpl < Domain::Repositories::BlobRepository
      def initialize(storage)
        @storage = storage
      end

      def save(blob)
        @storage.save(blob)
      end

      def find(id)
        @storage.find(id)
      end
    end
  end
end
