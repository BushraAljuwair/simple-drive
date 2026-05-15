module Domain
  module Repositories
    class BlobRepository
      def save(blob)
        raise NotImplementedError
      end

      def find(id)
        raise NotImplementedError
      end
    end
  end
end
