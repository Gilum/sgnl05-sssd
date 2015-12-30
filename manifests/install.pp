# See README.md for usage information
class sssd::install (
  $ensure                = $sssd::ensure,
  $sssd_package          = $sssd::sssd_package,
  $extra_packages        = $sssd::extra_packages,
  $extra_packages_ensure = $sssd::extra_packages_ensure,
) {

  package { $sssd_package:
    ensure => $ensure,
  }

  if $extra_packages {
    package { $extra_packages:
      ensure  => $extra_packages_ensure,
      require => Package[$sssd_package],
    }
  }

}
