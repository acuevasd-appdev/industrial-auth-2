class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

    def create?
    user == comment.owner ||       !comment.owner.private? ||      comment.owner.followers.include?(user)
  end

  def edit?
    user == comment.author
  end

  def update?
    user == comment.author
  end

  def destroy?
    user == comment.author || 
      user == comment.owner 
  end


end
