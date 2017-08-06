#include <array>
#include <type_traits>
#include <utility>

template <typename C, std::size_t N, std::size_t...Is>
constexpr std::array<C, sizeof...(Is) + 1> actual_truncate(const C(&s)[N], std::index_sequence<Is...>)
{
	return {(Is < N ? s[Is] : static_cast<C>(0))..., static_cast<C>(0)};
}

template <std::size_t L, typename C, std::size_t N>
constexpr std::array<C, L + 1> truncate(const C(&s)[N])
{
	return actual_truncate(s, std::make_index_sequence<L>{});
}

template<size_t c>
struct ForLoop {
	template<template <size_t> class Func>
	static void iterate() {
		ForLoop<c-1>::template iterate<Func>();
		Func<c>()();
	}
};

template<>
struct ForLoop<1> {
	template<template <size_t> class Func>
	static void iterate() {
		Func<1>()();
	}
};

static constexpr const char some_random_str[] = "FizzBuzz";

template <size_t size>
struct FizzBuzz {
	template <class T=void>
	std::enable_if_t<!(size % 3 == 0 || size % 5 == 0), T>
	operator()() {
		printf("%lu\n", size);
	}

	template <class T=void>
	std::enable_if_t<size % 3 == 0 || size % 5 == 0, T>
	operator()() {
		printf("%s\n", (size % 15 == 0 ? some_random_str :
		                (size % 5 == 0 ? some_random_str + 4 :
		                                 truncate<4>(some_random_str).data())));
	}
};

int main()
{
	ForLoop<100>::iterate<FizzBuzz>();
}
