interfacetracker: interfacetracker.o
	$(CC) $(LDFLAGS) interfacetracker.o -o interfacetracker -luci -L/home/gaganjotbhullar/Desktop/openwrt/staging_dir/target-mips_24kc_musl/root-ar71xx/lib/
interfacetracker.o: interfacetracker.c
	$(CC) $(CFLAGS) -c interfacetracker.c
clean:
	rm *.o interfacetracker
