module Domain
  module UseCases
    class StoreBlob
      def initialize(repository)
        @repository = repository
      end

      def call(blob)
        @repository.save(blob)
      end
    end
  end
end
