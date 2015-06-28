class WelcomeController < ApplicationController
  # before_action :set_customer, only: [:view_bill]

  def goto_link
  end

  def customers_list
    @customers = Customer.all
  end

  def customer_details
    @customer = Customer.find(params["customer_id"])
    @customer_orders = @customer.orders

    @amount = 0
    @customer_orders.each do |order|
      @product = Product.find(order.product_id)
      @product_cost = @product.price
      @amount = @amount + @product_cost
    end
  end

  def change_order_status
    @customer = Customer.find(params["customer_id"])
    @customer_orders = @customer.orders
    @customer_orders.each do |order|
      order.status = params["order_status"]
      order.save
    end
    redirect_to customer_details_path(:customer_id=>@customer.id)
  end

  def destroy_order
    flash[:danger] = "Forbidden"
    redirect_to place_order_path
  end

  def orders_list
    @orders = Order.all
    @order_customers = []
    @order_products = []
    @orders.each do |order|
      @order_customer = Customer.find(order.customer_id)
      @order_customers << @order_customer
      @order_product = Product.find(order.product_id)
      @order_products << @order_product
    end

    @order_customers_grouped_by_email = @order_customers.group_by { |t| t.email }
  end

  def place_order
    @customer = Customer.new
    @products = Product.all
  end

  def submit_order
    @customer = Customer.where(:email=>params["customer"]["email"]).first
    @result = ""
    if @customer.nil?
      @customer = Customer.new(customer_params)
      @customer.save
    end

    @customer_products_array = []
    params["customer"]["products_attributes"].each do |key, value|
      @customer_products_array << value["id"]
    end

    @customer_products_array.each do |key|
      @product = Product.find(key)
      @customer_order = @customer.orders.build(:status=>"created", :product=>@product)
      @customer_order.save
    end

    redirect_to view_bill_path(:customer_id=>@customer.id)
  end

  def view_bill
    @customer = Customer.find(params["customer_id"])
    @customer_orders = @customer.orders

    @amount = 0
    @customer_orders.each do |order|
      @product = Product.find(order.product_id)
      @product_cost = @product.price
      @amount = @amount + @product_cost
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_customer
  #   @customer = Customer.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:name, :phone_number, :email, :location, :products_attributes=>[], :orders=>[:status])
  end

end
