################################################################################
#
# python-pexpect
#
################################################################################

PYTHON_PEXPECT_VERSION = 4.0.1
PYTHON_PEXPECT_SITE = https://pypi.python.org/packages/source/p/pexpect
PYTHON_PEXPECT_SOURCE = pexpect-$(PYTHON_PEXPECT_VERSION).tar.gz
PYTHON_PEXPECT_LICENSE = ISC
PYTHON_PEXPECT_LICENSE_FILES = LICENSE
PYTHON_PEXPECT_SETUP_TYPE = distutils

# async.py is not usable with Python 2, and removing is the solution
# recommended by upstream:
# https://github.com/pexpect/pexpect/issues/290
ifeq ($(BR2_PACKAGE_PYTHON),y)
define PYTHON_PEXPECT_REMOVE_ASYNC_PY
	$(RM) $(@D)/pexpect/async.py
endef
PYTHON_PEXPECT_POST_PATCH_HOOKS += PYTHON_PEXPECT_REMOVE_ASYNC_PY
endif

$(eval $(python-package))
