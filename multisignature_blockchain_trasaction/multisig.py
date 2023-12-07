from bitcoin import *



k1 = random_key()
k2 = random_key()
k3 = random_key()

p1 = privtopub(k1)
p2 = privtopub(k2)
p3 = privtopub(k3)

print(k1,p1)
print(k2,p2)
print(k3,p3)


k = 2 #keys required

n = 3 #total generated  

s = mk_multisig_script([p1,p2,p3],k,n)
print(s)


