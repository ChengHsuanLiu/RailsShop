class Admins::ProductsController < Admins::BaseController
  def index
    @products = @shop.products
  end

  def new
    @product = @shop.products.new
  end

  def create
    @product = @shop.products.new(product_params)
    if @product.save
      redirect_to admins_products_path
    else
      render 'new'
    end
  end

  def edit
    @product = @shop.products.find_by_id(params[:id])
  end

  def update
    @product = @shop.products.find_by_id(params[:id])
    if @product.update(product_params)
      redirect_to edit_admins_product_path(@product)
    else
      render 'edit'
    end
  end

  def destroy
    @product = @shop.products.find_by_id(params[:id])
    @product.deleted_at = Time.now
    @product.save
    redirect_to admins_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :category_id, :public, :shop_id, :deleted_at, variants_attributes: [:id, :name, :stock, :unit_name, :price, :public, :product_id, :deleted_at, :_destroy])
  end
end
