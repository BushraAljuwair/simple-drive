# class Blob
#   attr_reader :id, :data, :size, :created_at

#   def initialize(id:, data:, size:, created_at:)
#     @id = id
#     @data = data
#     @size = size
#     @created_at = created_at
#   end
# end
module Domain
  module Entities
    class Blob
      attr_reader :id, :data, :size, :created_at

      def initialize(id:, data:, size:, created_at:)
        @id = id
        @data = data
        @size = size
        @created_at = created_at
      end
    end
  end
end
