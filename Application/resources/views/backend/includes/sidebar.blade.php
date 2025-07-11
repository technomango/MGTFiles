<aside class="vironeer-sidebar">
    <div class="overlay"></div>
    <div class="vironeer-sidebar-header">
        <a href="{{ route('admin.dashboard') }}" class="vironeer-sidebar-logo">
            <img src="{{ asset($settings['website_light_logo']) }}" alt="{{ $settings['website_name'] }}" />
        </a>
    </div>
    <div class="vironeer-sidebar-menu" data-simplebar>
        <div class="vironeer-sidebar-links">
            <div class="vironeer-sidebar-links-cont">
                <a href="{{ route('admin.dashboard') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'dashboard') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-th-large"></i>{{ __('Escritorio') }}</span>
                    </p>
                </a>
                <a href="{{ route('admin.users.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'users') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fa fa-users"></i>{{ __('Manage Users') }}</span>
                        @if ($unreadUsersCount)
                            <span class="counter">{{ $unreadUsersCount }}</span>
                        @endif
                    </p>
                </a>
                <div class="vironeer-sidebar-link @if (request()->segment(2) == 'transfers') active @endif" data-dropdown>
                    <p
                        class="vironeer-sidebar-link-title {{ $unreadUsersTransfersCount || $unreadGuestsTransfersCount ? 'exclamation' : '' }}">
                        <span><i class="fas fa-paper-plane"></i>{{ __('Manage Transfers') }}</span>
                        @if ($unreadUsersTransfersCount || $unreadGuestsTransfersCount)
                            <span class="counter"><span class="fas fa-exclamation"></span></span>
                        @endif
                        <span class="arrow"><i class="fas fa-chevron-right fa-sm"></i></span>
                    </p>
                    <div class="vironeer-sidebar-link-menu">
                        <a href="{{ route('admin.transfers.users.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'users') current @endif">
                            <p class="vironeer-sidebar-link-title">
                                <span class="me-1">{{ __('Users Transfers') }}</span>
                                @if ($unreadUsersTransfersCount)
                                    <span class="counter">{{ $unreadUsersTransfersCount }}</span>
                                @endif
                            </p>
                        </a>
                        <a href="{{ route('admin.transfers.guests.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'guests') current @endif">
                            <p class="vironeer-sidebar-link-title">
                                <span class="me-1">{{ __('Guest Transfers') }}</span>
                                @if ($unreadGuestsTransfersCount)
                                    <span class="counter">{{ $unreadGuestsTransfersCount }}</span>
                                @endif
                            </p>
                        </a>
                    </div>
                </div>
                <a href="{{ route('admin.subscriptions.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'subscriptions') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="far fa-gem"></i>{{ __('Subscriptions') }}</span>
                        @if ($unreadSubscriptions)
                            <span class="counter">{{ $unreadSubscriptions }}</span>
                        @endif
                    </p>
                </a>
                <a href="{{ route('admin.transactions.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'transactions') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-exchange-alt"></i>{{ __('Transactions') }}</span>
                        @if ($unreadTransactionsCount)
                            <span class="counter">{{ $unreadTransactionsCount }}</span>
                        @endif
                    </p>
                </a>
                <a href="{{ route('admin.plans.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'plans') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="far fa-credit-card"></i>{{ __('Pricing Plans') }}</span>
                    </p>
                </a>
                <a href="{{ route('admin.coupons.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'coupons') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-percent"></i>{{ __('Manage Coupons') }}</span>
                    </p>
                </a>
                <a href="{{ route('admin.advertisements.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'advertisements') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-ad"></i>{{ __('Advertisements') }}</span>
                    </p>
                </a>
            </div>
            <div class="vironeer-sidebar-links-cont">
                <div class="vironeer-sidebar-link @if (request()->segment(2) == 'navigation') active @endif" data-dropdown>
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-bars"></i>{{ __('Navigation') }}</span>
                        <span class="arrow"><i class="fas fa-chevron-right fa-sm"></i></span>
                    </p>
                    <div class="vironeer-sidebar-link-menu">
                        <a href="{{ route('admin.navbarMenu.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'navbarMenu') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('Navbar Menu') }}</span></p>
                        </a>
                        <a href="{{ route('admin.footerMenu.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'footerMenu') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('Footer Menu') }}</span></p>
                        </a>
                    </div>
                </div>
                @if ($settings['website_blog_status'])
                    <div class="vironeer-sidebar-link  @if (request()->segment(2) == 'blog') active @endif" data-dropdown>
                        <p class="vironeer-sidebar-link-title {{ $commentsNeedsAction ? 'exclamation' : '' }}">
                            <span><i class="fas fa-rss"></i>{{ __('Blog') }}</span>
                            @if ($commentsNeedsAction)
                                <span class="counter"><span class="fas fa-exclamation"></span></span>
                            @endif
                            <span class="arrow"><i class="fas fa-chevron-right fa-sm"></i></span>
                        </p>
                        <div class="vironeer-sidebar-link-menu">
                            <a href="{{ route('articles.index') }}"
                                class="vironeer-sidebar-link @if (request()->segment(3) == 'articles') current @endif">
                                <p class="vironeer-sidebar-link-title"><span>{{ __('Articles') }}</span></p>
                            </a>
                            <a href="{{ route('categories.index') }}"
                                class="vironeer-sidebar-link @if (request()->segment(3) == 'categories') current @endif">
                                <p class="vironeer-sidebar-link-title"><span>{{ __('Categories') }}</span></p>
                            </a>
                            <a href="{{ route('comments.index') }}"
                                class="vironeer-sidebar-link @if (request()->segment(3) == 'comments') current @endif">
                                <p class="vironeer-sidebar-link-title">
                                    <span>{{ __('Comments') }}</span>
                                    @if ($commentsNeedsAction)
                                        <span class="counter">{{ $commentsNeedsAction }}</span>
                                    @endif
                                </p>
                            </a>
                        </div>
                    </div>
                @endif
                @if ($settings['website_tickets_status'])
                    <a href="{{ route('tickets.index') }}"
                        class="vironeer-sidebar-link @if (request()->routeIs('tickets.*')) current @endif">
                        <p class="vironeer-sidebar-link-title">
                            <span><i class="far fa-life-ring"></i>{{ __('Support Tickets') }}</span>
                            @if ($ticketsNeedsAction)
                                <span class="counter">{{ $ticketsNeedsAction }}</span>
                            @endif
                        </p>
                    </a>
                @endif
                <a href="{{ route('admin.settings.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(2) == 'settings') current @endif">
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fa fa-cog"></i>{{ __('Settings') }}</span>
                    </p>
                </a>
            </div>
            <div class="vironeer-sidebar-links-cont">
                <div class="vironeer-sidebar-link @if (request()->segment(2) == 'others') active @endif" data-dropdown>
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-layer-group"></i>{{ __('Manage Sections') }}</span>
                        <span class="arrow"><i class="fas fa-chevron-right fa-sm"></i></span>
                    </p>
                    <div class="vironeer-sidebar-link-menu">
                        <a href="{{ route('admin.slideshow.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'slideshow') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('Slide Show') }}</span></p>
                        </a>
                        <a href="{{ route('admin.features.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'features') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('Home Features') }}</span></p>
                        </a>
                        <a href="{{ route('admin.faq.index') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'faq') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('Home FAQ') }}</span></p>
                        </a>
                    </div>
                </div>
                <div class="vironeer-sidebar-link @if (request()->segment(3) == 'popup-notice' || request()->segment(3) == 'custom-css') active @endif" data-dropdown>
                    <p class="vironeer-sidebar-link-title">
                        <span><i class="fas fa-plus-square"></i>{{ __('Extra Features') }}</span>
                        <span class="arrow"><i class="fas fa-chevron-right fa-sm"></i></span>
                    </p>
                    <div class="vironeer-sidebar-link-menu">
                        <a href="{{ route('admin.additional.notice') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'popup-notice') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('PopUp Notice') }}</span></p>
                        </a>
                        <a href="{{ route('admin.additional.css') }}"
                            class="vironeer-sidebar-link @if (request()->segment(3) == 'custom-css') current @endif">
                            <p class="vironeer-sidebar-link-title"><span>{{ __('Custom CSS') }}</span></p>
                        </a>
                    </div>
                </div>
                <a href="{{ route('admin.additional.addons.index') }}"
                    class="vironeer-sidebar-link @if (request()->segment(3) == 'addons') current @endif">
                    <p class="vironeer-sidebar-link-title"><i
                            class="fas fa-puzzle-piece"></i><span>{{ __('Addons Manager') }}</span></p>
                </a>
                <a href="{{ route('admin.additional.cache') }}" class="vironeer-link-confirm vironeer-sidebar-link">
                    <p class="vironeer-sidebar-link-title"><i
                            class="far fa-trash-alt"></i><span>{{ __('Clear Cache') }}</span></p>
                </a>
            </div>
        </div>
    </div>
</aside>
