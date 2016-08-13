class OrdersController < ApplicationController

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render xml: @orders }
    end
  end

  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @order }
    end
  end

  def create
    @order = Order.new(order_params)
    #TODO
    @order.user_id = current_user.id


    respond_to do |format|
      if @order.save
        #@order.pages = PDF::Reader.new(open(@order.file_url)).page_count
        @order.pages = @order.count_pages
        if @order.is_color?
          unit_price = 500
        else
          unit_price = 50
        end
        @order.price = (@order.pages/@order.slide_per_page.to_f).ceil * unit_price * @order.quantity
        @order.save
        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to home_mypage_path }
        format.xml  { render xml: @order, status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update(order_params)
        flash[:notice] = 'Order was successfully updated.'
        format.html { redirect_to(@order) }
        format.xml  { head :ok }
      else
        format.html { render action: 'edit' }
        format.xml  { render xml: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end
  end

  def order_params
    params.require(:order).permit(:title, :file, :is_double_side, :is_color, :slide_per_page, :price, :location, :quantity, :progress)
  end
end
