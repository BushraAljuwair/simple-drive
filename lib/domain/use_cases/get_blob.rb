module Domain
  module UseCases
    class GetBlob
      def initialize(repository)
        @repository = repository
      end

      def call(id)
        @repository.find(id)
      end
    end
  end
end
