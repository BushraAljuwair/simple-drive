# module Infrastructure
#   module Storages
#     class DatabaseStorage
#       def save(blob)
#         BlobDatum.create!(
#           blob_id: blob.id,
#           data: blob.data
#         )
#       end


#       def read(id)
#         BlobDatum.find_by!(blob_id: id).data
#       end
#     end
#   end
# end
module Infrastructure
  module Storages
    class DatabaseStorage
      def save(blob)
        BlobDatum.create!(
          blob_id: blob.id,
          data: blob.data
        )
      end


      def find(id)
        BlobDatum.find_by!(blob_id: id).data
      end
    end
  end
end
