# Introduction #

I once tried to read Bourbaki's _Theory of Sets_ but found it utterly incoherent. It turns out that really, only the "Summary of Results" are necessary for understanding set theory. But I found out a beautiful project translating Bourbaki's _Theory of Sets_ into `Coq` code (for the automatic theorem prover [`Coq`](http://en.wikipedia.org/wiki/Coq)).

  1. J. Grimm, "Implementation of Bourbaki's Elements of Mathematics in Coq: Part One, Theory of Sets" [ePrint (PDF)](http://hal.archives-ouvertes.fr/docs/00/40/81/43/PDF/RR-6999.pdf) --- note it is 204 pages.
  1. J. Grimm, "Implementation of Bourbaki's Elements of Mathematics in Coq: Part Two; Ordered Sets, Cardinals, Integers" [ePrint (pdf)](http://hal.archives-ouvertes.fr/docs/00/44/07/86/PDF/RR-7150.pdf) --- note it is 307 pages long.

Mr Grimm kindly explains the frustratingly cryptic notation and terms used by Bourbaki. For example

> Bourbaki defines (∃x)R as (τ<sub>x</sub>(R)|x)R. Write y instead of τ<sub>x</sub>(R). Our
> expression is (y|x)R. It does not contain the variable x, since x is not in y.
> If (∃x)R is true, then R is true for at least one object, namely y.
> This object is explicit: we do not need to introduce a specific axiom of choice.
> Axiom scheme S5 states the converse: if for some T, (T|x) R is true, then
> (∃x)R is true. (Part 1, page 11)

This turns out to be Bourbaki's bizarre formulation of [Epsilon Calculus](http://en.wikipedia.org/wiki/Epsilon_calculus) which has become more or less antiquated.

## Axioms ##

This is a review of [my blogpost](http://texnicalstuff.blogspot.com/2011/10/epsilon-calculus.html). The basic five axioms for Bourbaki's set theory is:

  1. Axiom of extension, A1. (∀ x)(∀ y)((x⊂y and y⊂x) implies (x=y)). (Sets II §1.4, pg 67)
  1. Axiom of the set of two elements, a.k.a. Axiom of Pairing, A2. (∀ x)(∀ y) Coll<sub>z</sub>(z=x or z=y). (Sets II §1.5, pg 69)
  1. Axiom of the ordered pair (Sets II §2.1, pg 72): (∀ x)(∀ x')(∀ y) (∀ y') (((x,y) = (x',y')) implies (x=x' and y=y'))
  1. Axiom of the set of subsets (Sets II §5.1, pg 101): (∀ X) Coll<sub>Y</sub> (Y⊂X). In other words, for any set X, we can form its power set.
  1. Axiom of infinity (Sets III §6.1, pg 183): A5. There exists an infinite set.

This is formally equivalent to the [Zermelo formulation](http://en.wikipedia.org/wiki/Zermelo_set_theory) of set theory.

The epsilon calculus gives the axiom of _global_ choice. Yes, _global_ choice.

How? Well, we have the rule of inference:

> ∀x ((A(x) if and only if B(x)) implies (εx A = εx B))

which gives us the axiom of _global_ choice, because here the epsilon operator acts as the _choice operator_.