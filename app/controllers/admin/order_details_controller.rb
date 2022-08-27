class Admin::OrderDetailsController < ApplicationController
        before_action :authenticate_admin!
    def update
        @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])
        if @order_detail.update(order_detail_params)
          if @order_detail.status == "manufacturing"
            @order_detail.order.update(status: "making" )
          elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(status: "finish" ).count
            @order_detail.order.update(status: "preparing_ship")
          end
          redirect_to admin_order_path(@order_detail.order_id)
        else
          render 'admin/order/show'
        end
    end

  private

  def order_detail_params
      params.require(:order_detail).permit(:status)
  end


end
