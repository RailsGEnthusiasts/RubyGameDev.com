ShowcasePolicy = Struct.new(:user, :showcase) do
  def update?
    return false unless user
    user.admin? || showcase.user == user
  end

  def destroy?
    return false unless user
    user.admin?
  end
end
