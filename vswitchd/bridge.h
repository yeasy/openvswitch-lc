/* Copyright (c) 2008, 2009, 2010, 2011, 2012 Nicira, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at:
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef VSWITCHD_BRIDGE_H
#define VSWITCHD_BRIDGE_H 1

#ifndef LC_ENABLE
#define LC_ENABLE
#endif

#ifndef LC_MCAST_PORT
#define LC_MCAST_PORT 5000
#endif

struct simap;
struct bloom_filter;
struct bridge;

void bridge_init(const char *remote);
void bridge_exit(void);

void bridge_run(void);
void bridge_run_fast(void);
void bridge_wait(void);

void bridge_get_memory_usage(struct simap *usage);
#ifdef LC_ENABLE
int bridge_update_bf_gdt(const struct bridge *br, struct bloom_filter *bf);
#endif

#endif /* bridge.h */
