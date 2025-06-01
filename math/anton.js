//https://www.hackerearth.com/problem/algorithm/building-the-anton/


/*

if we remove red then x-> 2x
if we remove green then x -> x-1


input n and m

n = 1,m=3

step 1 -> red -> 2 x 1 = 2
step 2 -> red -> 2 x 2 = 4
step 3 -> green -> x = x-1 -> 4 = 4-1 = 3(goal_state)


*/
/*

// i want to use gready

// reverse gready approch 

// if M is greter then n and m is even then divide my 2
//                          if m is odd increment m by 1

        repeate this loops until M<=n then we need n-m green wires

        */

function main(n,m) {
    let steps = 0;
    while(m>n) {
        // check odd ot even
        if(m%2 == 0) { 
            m = m/2;
        } else {
            m = m + 1;
        }
        steps = steps + 1;
    }

    return steps + (n - m);
}


var ans = main(1,3);
console.log(ans);