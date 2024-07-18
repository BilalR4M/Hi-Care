(function () {
	function showTab(link) {
		var tabs = link.closest(".tabs");
		if (!tabs) {
			return;
		}
		var scope = link.closest(".card") || document;
		tabs.querySelectorAll(".tabs__link").forEach(function (anchor) {
			anchor.classList.toggle("is-active", anchor === link);
			anchor.classList.toggle("active", anchor === link);
		});
		scope.querySelectorAll(".panel").forEach(function (group) {
			group.classList.remove("is-visible");
		});
		var id = link.getAttribute("href");
		if (id && id.charAt(0) === "#") {
			var panel = scope.querySelector(id);
			if (panel) {
				panel.classList.add("is-visible");
			}
		}
	}

	document.addEventListener("click", function (event) {
		var link = event.target.closest(".tabs__link");
		if (!link) {
			return;
		}
		var href = link.getAttribute("href") || "";
		if (href.charAt(0) !== "#") {
			return;
		}
		event.preventDefault();
		showTab(link);
	});

	document.addEventListener("DOMContentLoaded", function () {
		document.querySelectorAll(".tabs").forEach(function (tabs) {
			var current = tabs.querySelector(".tabs__link.is-active, .tabs__link.active") || tabs.querySelector(".tabs__link");
			if (current) {
				showTab(current);
			}
		});

		var page = location.pathname.split("/").pop();
		document.querySelectorAll(".shell__nav-link[href]").forEach(function (anchor) {
			if (anchor.getAttribute("href") === page) {
				anchor.setAttribute("aria-current", "page");
			}
		});
	});
})();
