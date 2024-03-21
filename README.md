# MacMac

You want to generate Your own Mac Addresses or manipulate exiting addresses? Mac Man has you covered.

## Create Random addresses

Completely randomized address. Mac Man ensures that the broadcast flag is not set and the locally administered flag is set.

```ruby
random_address = MacMan::Address.new
```

## Create Random address with prefix

Create Address where the NIC part is randomized but the prefix is fix.

```ruby
random_address = MacMan::Address.new(oui: 0xAB_CD_EF)
```






