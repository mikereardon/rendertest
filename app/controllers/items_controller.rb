class ItemsController < ApplicationController
  before_action :setup_rfq

  def new
  end

  def destroy
  end

  private

  def setup_rfq
    @rfq = Rfq.new(items: [ Item.new ])
  end
end
