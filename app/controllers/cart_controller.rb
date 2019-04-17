class CartController < ApplicationController
  
  before_action :authenticate_user!
  
  
  def add
    # we need the id of the product to be added
    # lets get it now
    
    id = params[:id]
    # if the cart exists already use it if not make a new one
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    
    # If the product is in the cart then increase the existing quantity by 1
     if cart[id] then
     cart[id] = cart[id] + 1 # this is the actual increase quantity part
     else
     cart[id] = 1
     end
      redirect_to :action => :index
  
  end
  
  
  #####clear cart##########
  def clearCart
    #   This sets the cart session to not exist
    session[:cart] = nil
    redirect_to :action => :index
    
  end 
  
  ###### start of remove cart #####
  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    
      redirect_to :action => :index
    
  end 

  
  #####start of index loginc #######
  
  def index
    
      # this method will pass the content of the cart to the page view
    
    if session[:cart] then
      @cart = session[:cart] # if session exists the pass cart contents to the cart view
     else 
       @cart = {} # if the cart isnt a session the say the cart contents is empty
       
    end  
  end
  
  def decrease
    id = params[:id]
    cart = session[:cart]
    
    if cart[id] == 1 then
      cart.delete id
    else
    cart[id] = cart[id] - 1
    end
    redirect_to :action => :index
  end
  
  def createOrder
  # step 1 find out who is actually placing the order
  @user = User.find(current_user.id) 
  
  # step 2 actuallly make the order we want to keep in our database
  @order = @user.orders.build(:order_date => DateTime.now, :status => "Pending")
  @order.save
  
  # step 3 - take all items from current cart and associate them with the order
  @cart = session[:cart] || {} # This gets the content from the current shopping cart
  
  @cart.each do |id, quantity|
    item = Item.find_by_id(id)
    
    @orderitems = @order.orderitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price => item.price)
    @order.save
  
  
  end 
  
  @orders = Order.all
  
  
  @orderitems = Orderitem.where(order_id: Order.last)
  
  
  end
 
end
 
 
