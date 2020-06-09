class LanVanController < ApplicationController
  def index
    @members= Member.where(lan_van_collection_required:true).or(Member.where(lan_van_dropoff_required:true))
  end
end
