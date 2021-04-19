class isoc::resources 
{
  ### Manage sudo configs
  $sudo_confs = lookup('sudo_confs', Hash, 'deep', {})
  if $sudo_confs {
    create_resources('sudo::conf', $sudo_confs)
  }

   ### Manage Files
  $files = lookup('files', Hash, 'deep', {})
  if $files {
    create_resources('file', $files)
  }
   ### Manage Packages
  $packages = lookup('packages', Hash, 'deep', {})
  if $packages {
    create_resources('package', $packages)
  }

}
