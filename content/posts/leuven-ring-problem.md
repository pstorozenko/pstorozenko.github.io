---
title: "The Leuven Ring Problem ◯‍"
date: 2021-09-06T07:33:51+02:00
katex: true
tags: ["easy", "math", "circles", "erasmus"]
---

During my studies, I spent one semester at [KU Leuven](https://www.kuleuven.be/english/).
There is one interesting mathematical problem from those times I'd like to share.
This Belgian city has a topology of a big circle with a city inside.

{{< openstreetmap mapName="leuven_652789" >}}

One early, cold, damp, and windy morning (as it is in Belgium) when I was coming back from some trip I had to go from the railway station (right side of the ring) to my dormitory (bottom of the ring).
As shown on the map, the distance was 1/3 circumference of the Leuven ring.
The question I asked myself is whether or not I should cross the street.

1. If you cross the road and walk on the inner side of Tiensevest street (the yellow ring street) you are walking around a smaller circle.
2. If you don't cross the street, you walk around a bigger circle but save energy on crossing the road.

## Ring calculations

The Tiensevest is a pretty wide street, roughly $d = 30$m.
The inner ring radius is approximately $r_1 = 1\ 000$m.
So the outer ring has radius $r_2 = r_1 + d = 1\ 030$m.
Circumference of a circle is $c = 2\pi r$.

1. The first path is $p_1 = (2\pi r_1) / 3 + 2 d$ since we have to pass the street twice.
2. The second path is $p_2 = (2\pi r_2) / 3 = (2\pi (r_1 + d)) / 3$.

If we approximate $\pi \approx 3$ as I did during that morning we found out that:
$$
p_1 = (2\pi r_1) / 3 + 2 d = 2r_1 + 2d =  2 (r_1 + d),
$$
$$
p_2 = (2\pi (r_1 + d)) / 3 = 2 (r_1 + d).
$$
So $p_1 = p_2$!!!
This means the distance we saved by walking around a smaller circle is lost on crossing the street.

## When should I cross the street?

The previous calculations were _back-of-the-envelope calculations_ made without any envelope.
Instead of fixing the fraction of circle traveled on 1/3 let's consider any fraction.

### On describing fraction of circle

A small inclusion on fractions of a circle.
There are few methods that we use to describe the fraction of a circle.

1. The simplest is probably just fraction $p \in [0, 1]$ of the whole circumference.
2. Another natural description is to describe fraction in terms of angle from $0^\circ$ to $360^\circ$ in degrees.
3. Finally, the least intuitive (at first) method is to describe fraction as angle from $0$ to $2\pi$ radians.

As we will see here, the last method might be the simplest in right case!

### Back to the rings

Since the whole circle circumference is $2\pi r$, the fraction of angle $\varphi$ in radians is just $l = \varphi r$.
So:
$$
p_1 = \varphi r_1 + 2d,
$$
$$
p_2 = \varphi r_2 = \varphi (r_1 + d).
$$
The difference between paths is:
$$
p_2 - p_1 = \varphi (r_1 + d) - (\varphi r_1 + 2d) = \varphi r_1 + \varphi d - \varphi r_1 - 2d =  \varphi d - 2d = (\varphi - 2) d.
$$
This value represents gain when crossing the street compared to sticking to the outer circle.
Crossing to the inner circle is worth only when you travel at least 2 radians so $2 / 2\pi = 1/ \pi \approx 0.32$ of the whole circumference.
What is worth mentioning is that it doesn't depend on the sizes of circles and margin $d$.

So what is the cost of crossing/not crossing the street?
It may be hard to calculate $1/\pi$ in your head but you will miss the optimal travel distance by $\pm d$ in angles $\varphi \in [1, 3]$ rad or $\alpha \in [57 ^\circ , 172^\circ]$, reasonably wide margin.
Probably gain is too small to compensate for time spent on waiting for lights to change.

Another thing I'd like to point out is that we encountered 2 radians here.
Not $\pi/3$ or $\pi/6$ radians.
Just 2 radians.
It's uncommon but it happens to meet values in radians that are not a rational fractions of $2\pi$.
When you cover the angle of 2 radians, you travel exactly the distance of 2 radiuses around a circle (that's from the definition).

## Strange linearity of circle circumference

Another fact I'd like to mention is what happens when you go all the way around the outer circle.
Distance traveled is
$$
2 \pi r_2 = 2 \pi (r_1 + d) = 2\pi r_1 + 2\pi d.
$$
We can split this value into two parts.
One reflects the circumference of a circle with radius $r_1$ and the other with radius $d$.
So effectively going around the outer circle is equivalent to **independently** going around two circles.
An inner circle and a circle with radius $d = r_2 - r_1$.
Isn't it strange in some way?

## A related classic physics exercise from highschool

> There is a rope along the Moon's equator. How much should you lengthen the rope to be able to pass underneath it at any point without touching the rope? You need 30cm. Assume the Moon is a perfect sphere suspended in a vacuum with a radius of 1 737.4 km.

The situation looks almost the same as in Leuven with inner circle $r_1 = 1\ 737\ 400$m and $d = 0.3 m$.
The initial rope length is $2\pi r_1$.
Required rope length is $2\pi (r_1 + d)$.
Difference in lengths is $2\pi (r_1 + d) - 2\pi r_1 = 2\pi d$.
So you have to lengthen the rope by just $2\pi d \approx 2.88$m.
Compared to the original rope length $2\pi r_1 \approx 10\ 916\ 406.15$m it's nothing...
The result is as strange as it was 10+ years ago.
It doesn't matter if the line is around the Moon, the Earth, the Milky Way, or around some small tree/pole...

## Summary

Probably it's not worth crossing the street on the other side when going around the circle as in the Leuven scenario.
Some physics exercises answers will be strange for your whole life.
