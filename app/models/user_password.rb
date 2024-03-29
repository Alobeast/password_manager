class UserPassword < ApplicationRecord
  # owner can view edit and share, editor can edit, viewer can view the password
  ROLES = %w(owner viewer editor)
  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclusion: { in: ROLES }

  attribute :role, default: :viewer

  def owner?
    role == 'owner'
  end

  def editor?
    role == 'editor'
  end

  def viewer?
    role == 'viewer'
  end

  def editable?
    owner? || editor?
  end

  def shareable?
    owner?
  end

  def deletable?
    owner?
  end
end
