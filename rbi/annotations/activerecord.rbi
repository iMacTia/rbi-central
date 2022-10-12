# typed: strict

class ActiveRecord::Schema
  sig {params(info: T::Hash[T.untyped, T.untyped], blk: T.proc.bind(ActiveRecord::Schema).void).void}
  def self.define(info = nil, &blk); end
end

class ActiveRecord::Migration
  # @shim: Methods on migration are delegated to `SchemaStatements` using `method_missing`
  include ActiveRecord::ConnectionAdapters::SchemaStatements
  # @shim: Methods on migration are delegated to `DatabaseaStatements` using `method_missing`
  include ActiveRecord::ConnectionAdapters::DatabaseStatements
end

module ActiveRecord::Persistence
  sig {params(options: T::Hash[T.untyped, T.untyped], block: T.proc.params(arg0: T.untyped).void).returns(T::Boolean)}
  def save(**options, &block); end
  
  sig {params(options: T::Hash[T.untyped, T.untyped], block: T.proc.params(arg0: T.untyped).void).returns(TrueClass)}
  def save!(**options, &block); end
end
