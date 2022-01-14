require 'shrine'
require 'shrine/storage/file_system'
 
Shrine.storages = { 
  cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary 
  store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads'),       # permanent 
}
 
Shrine.plugin :activerecord # AR integration
Shrine.plugin :derivatives, create_on_promote: true # Save image in multiple versions
Shrine.plugin :backgrounding # Background processing

Shrine::Attacher.promote_block do
  PromoteJob.perform_async(self.class.name, record.class.name, record.id, name, file_data)
end