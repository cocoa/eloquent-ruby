class DocumentIdentifier
  attr_reader :folder, :name

  def initialize(folder,name)
    @folder = folder
    @name = name
  end

  # double equals for everyday use

  def ==(other)
    return true if other.equal?(self)
    return false unless other.kind_of?(self.class)
    folder == other.folder && name == other.name
  end

  # well behaved hash keys

  def hash
    folder.hash ^ name.hash # eXclusive OR operator
  end

  def eql?(other)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name = other.name
  end

end



class ContractIdentifier < DocumentIdentifier
  # not implemented
end