package utils

import "golang.org/x/sys/unix"

func Uname() (string, error) {
	u := unix.Utsname{}
	if err := unix.Uname(&u); err != nil {
		return err
	}
	return string(u.Sysname[:256]), nil
}
