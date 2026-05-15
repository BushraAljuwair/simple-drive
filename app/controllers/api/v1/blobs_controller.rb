

require "base64"

class Api::V1::BlobsController < ApplicationController
def create
  begin
    decoded_data = Base64.strict_decode64(params[:data])
  rescue ArgumentError
    return render json: {
      error: "Invalid Base64 data"
    }, status: :bad_request
  end

  blob = Domain::Entities::Blob.new(
    id: params[:id],
    data: decoded_data,
    size: decoded_data.bytesize,
    created_at: Time.now.utc
  )

  storage = Infrastructure::Storages::S3Storage.new
  repository = Infrastructure::Repositories::BlobRepositoryImpl.new(storage)
  use_case = Domain::UseCases::StoreBlob.new(repository)

  use_case.call(blob)

  BlobRecord.create!(
    blob_id: blob.id,
    size: blob.size
  )

  render json: { message: "blob saved" }, status: :created

rescue => e
  render json: {
    error: e.message,
    class: e.class.name
  }, status: :bad_request
end

  def show
    storage = Infrastructure::Storages::S3Storage.new
    repository = Infrastructure::Repositories::BlobRepositoryImpl.new(storage)
    use_case = Domain::UseCases::GetBlob.new(repository)

    data = use_case.call(params[:id])

    record = BlobRecord.find_by!(blob_id: params[:id])

    render json: {
      id: params[:id],
      data: Base64.strict_encode64(data),
      size: record.size,
      created_at: record.created_at
    }
  end
end
