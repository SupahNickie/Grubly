OrderPolicy = Struct.new(:user, :order) do
  def show?
    user.present? && ((user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin"))
  end

  def create?
    user.present?
  end

  def edit?
    user.present? && ((user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin"))
  end

  def update?
    user.present? && ((user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin"))
  end

  def destroy?
    user.present? && ((user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin"))
  end

  def edit_after_final?
    user.present? && ((order.restaurant.owner == user.id) || (user.role == "admin"))
  end

  def finalize?
    user.present? && ((user.id == order.user_id) || (order.restaurant.owner == user.id) || (user.role == "admin"))
  end

  def send_receipt?
    user.present? && ((order.restaurant.owner == user.id) || (user.role == "admin"))
  end
end
